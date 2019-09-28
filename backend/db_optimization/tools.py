import time
import statistics
from db_optimization._6_lazy_load import lazy_load

class TimeTestTool:
    # Compute function running time count
    @classmethod
    def calc_func_time(cls, func):
        start = time.perf_counter()
        func()
        end = time.perf_counter()
        return end - start

    # Compute function running time count
    @classmethod
    def statistic_run_time(cls, func, n):
        data = [cls.calc_func_time(func) for i in range(n)]
        mean = statistics.mean(data)
        sd = statistics.stdev(data, xbar=mean)
        return [data, mean, sd, max(data), min(data)]

    # Comparision
    @classmethod
    def compare(cls, func1, func2, n):
        result1 = cls.statistic_run_time(func1, n)
        result2 = cls.statistic_run_time(func2, n)
        print('Comparision\t W\O preload \t W preload')
        print('Avergae\t', result1[1], '\t', result2[1])

if __name__ == '__main__':
    # DataTool.generate_fake_user_data(10000)
    TimeTestTool.compare(lazy_load.lazy_load, lazy_load.pre_load, 100)